# Called by bump.sh as: awk -v v=<version> -f bump.awk <SHA256SUMS file> <formula>. Prints the formula pointed at v.
FILENAME == ARGV[1] {
  name = $2; sub(/^\*/, "", name)
  if (NF == 2 && length($1) == 64 && $1 ~ /^[0-9a-f]+$/) sha[name] = $1
  next
}
/^  version "/ { sub(/"[^"]*"/, "\"" v "\""); versions++ }
/url "https:\/\/github\.com\/carbium-sh\/carbium-js\/releases\/download\/cli-v/ {
  sub(/cli-v[^\/]+\//, "cli-v" v "/")
  name = $0; sub(/"[[:space:]]*$/, "", name); sub(/.*\//, "", name)
  if (!(name in sha)) { print "bump: " name " is not in SHA256SUMS of cli-v" v > "/dev/stderr"; bad = 1; want = "-"; next }
  want = sha[name]; urls++
}
/^ *sha256 "/ {
  if (want == "") { print "bump: a sha256 line with no url line before it" > "/dev/stderr"; bad = 1 }
  sub(/"[^"]*"/, "\"" want "\""); want = ""
}
{ print }
END {
  if (versions != 1 || urls == 0) { print "bump: the formula has no version line or no release url" > "/dev/stderr"; bad = 1 }
  exit bad
}
