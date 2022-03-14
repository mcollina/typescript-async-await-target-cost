#!/bin/bash

set -e

echo "benchmarking async/await with TS default target es3"
npx tsc --lib es2015,dom loop.ts --outfile loop.es2015-dom.js
node loop.es2015-dom.js

echo "------------------------------------------------------"

echo "benchmarking async/await with TS target es2015"
npx tsc --target es2015 loop.ts --outfile loop.es2015.js
node loop.es2015.js

echo "------------------------------------------------------"

echo "benchmarking async/await with TS target es2016"
npx tsc --target es2016 loop.ts --outfile loop.es2016.js
node loop.es2016.js

echo "------------------------------------------------------"

echo "benchmarking async/await with TS target es2017"
npx tsc --target es2017 loop.ts --outfile loop.es2017.js
node loop.es2017.js

echo "------------------------------------------------------"

echo "benchmarking async/await with TS target es2018"
npx tsc --target es2018 loop.ts --outfile loop.es2018.js
node loop.es2018.js

echo "------------------------------------------------------"

echo "benchmarking async/await with TS target es2022"
npx tsc --target es2022 loop.ts --outfile loop.es2022.js
node loop.es2022.js


echo "------------------------------------------------------"

echo "benchmarking async/await with TS target esnext"
npx tsc --target esnext loop.ts --outfile loop.esnext.js
node loop.esnext.js
