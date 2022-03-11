#!/bin/bash

set -e

echo "benchmarking async/await with TS default target es3"
npx tsc --lib es2015,dom loop.ts
node loop.js

echo "------------------------------------------------------"

echo "benchmarking async/await with TS target es2015"
npx tsc --target es2015 loop.ts
node loop.js

echo "------------------------------------------------------"

echo "benchmarking async/await with TS target es2016"
npx tsc --target es2016 loop.ts
node loop.js

echo "------------------------------------------------------"

echo "benchmarking async/await with TS target es2017"
npx tsc --target es2017 loop.ts
node loop.js

echo "------------------------------------------------------"

echo "benchmarking async/await with TS target es2018"
npx tsc --target es2018 loop.ts
node loop.js

echo "------------------------------------------------------"

echo "benchmarking async/await with TS target esnext"
npx tsc --target esnext loop.ts
node loop.js
