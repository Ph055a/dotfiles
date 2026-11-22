#!/usr/bin/env bash
# Economy numbers from the St. Louis Fed (FRED) for polybar.
# Downloads are kept for 6 hours in ~/.cache/fred; if offline, the last copy is used.
cache="$HOME/.cache/fred"; mkdir -p "$cache"

get() { # $1 = series name; prints its CSV
  local f="$cache/$1.csv"
  if [ ! -s "$f" ] || [ -n "$(find "$f" -mmin +360)" ]; then
    curl -sf -m 15 "https://fred.stlouisfed.org/graph/fredgraph.csv?id=$1" -o "$f.tmp" && mv "$f.tmp" "$f"
  fi
  [ -s "$f" ] && cat "$f"
}

# Latest real number (skips the blank days FRED marks with ".")
latest() { get "$1" | awk -F, 'NR>1 && $2+0==$2 {v=$2} END {if (v!="") printf "%.2f", v}'; }

# Inflation: how much prices rose over the last 12 months, in %
inflation() { get CPIAUCSL | awk -F, 'NR>1 && $2+0==$2 {a[++n]=$2} END {if (n>12) printf "%.1f", (a[n]/a[n-12]-1)*100}'; }

fed=$(latest FEDFUNDS); cpi=$(inflation); jobs=$(latest UNRATE | sed "s/0$//"); bond=$(latest DGS10)
echo "FED ${fed:-?}%  INF ${cpi:-?}%  UNEMP ${jobs:-?}%  10Y ${bond:-?}%"
