#!/bin/sh
# index.html (артефакт нұсқасы) -> site/index.html (хостингке арналған толық құжат)
# Іске қосу: sh build.sh

set -e
cd "$(dirname "$0")"
mkdir -p site

{
  cat <<'HEAD'
<!doctype html>
<html lang="kk">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="theme-color" content="#0F0C18">
<meta name="description" content="Ислам мен Анельдің үйлену тойына шақыру — 18 қазан 2026, сағат 18:00, «Рахат Думан» мейрамханасы, Қордай ауданы.">

<meta property="og:type" content="website">
<meta property="og:locale" content="kk_KZ">
<meta property="og:title" content="Ислам &amp; Анель · Үйлену тойы">
<meta property="og:description" content="18 қазан 2026, сағат 18:00 — «Рахат Думан» мейрамханасы, Қордай ауданы">
<meta name="twitter:card" content="summary">

<link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'%3E%3Crect width='32' height='32' fill='%230F0C18'/%3E%3Ccircle cx='16' cy='16' r='9' fill='none' stroke='%23D3B072' stroke-width='1.6'/%3E%3Ccircle cx='16' cy='16' r='3' fill='none' stroke='%23D3B072' stroke-width='1.2'/%3E%3C/svg%3E">

<title>Ислам &amp; Анель</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
HEAD
  sed -n '4p' index.html
  printf '</head>\n<body>\n'
  tail -n +5 index.html
  printf '</body>\n</html>\n'
} > site/index.html

echo "site/index.html дайын — $(wc -c < site/index.html) байт"
