package test

import (
	"os/exec"
	"testing"
)

// Credential-free smoke test: init -backend=false + validate over the root
// module and examples. Catches broken HCL, bad references, and provider-schema
// mismatches without touching the GitHub API.

// dirs validated: the root module and every example.
var dirs = []string{"..", "../examples/complete", "../examples/wrapper", "../wrapper"}

func TestTerraformValidate(t *testing.T) {
	if _, err := exec.LookPath("terraform"); err != nil {
		t.Skip("terraform not installed")
	}
	for _, dir := range dirs {
		dir := dir
		t.Run(dir, func(t *testing.T) {
			run(t, dir, "init", "-backend=false", "-input=false", "-no-color")
			run(t, dir, "validate", "-no-color")
		})
	}
}

func run(t *testing.T, dir string, args ...string) {
	t.Helper()
	cmd := exec.Command("terraform", args...)
	cmd.Dir = dir
	if out, err := cmd.CombinedOutput(); err != nil {
		t.Fatalf("terraform %v in %s failed: %v\n%s", args, dir, err, out)
	}
}
