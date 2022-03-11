# typescript-async-await-target-cost

This project aims to benchmark the cost of an await in TypeScript with different targets.

__TL;DR set at least es2017 as a target.__

## The file

```typescript
async function empty () {
  return true
}

async function loop () {
  console.time('loop')
  for (let i = 0; i < 1000000; i++) {
    await empty
  }
  console.timeEnd('loop')
}

loop()
```

## The Results

```
benchmarking async/await with TS default target es3
loop: 144.375ms
------------------------------------------------------
benchmarking async/await with TS target es2015
loop: 153.384ms
------------------------------------------------------
benchmarking async/await with TS target es2016
loop: 111.933ms
------------------------------------------------------
benchmarking async/await with TS target es2017
loop: 96.598ms
------------------------------------------------------
benchmarking async/await with TS target es2018
loop: 97.948ms
------------------------------------------------------
benchmarking async/await with TS target esnext
loop: 97.288ms
```

## Why

If we are not setting the target in TypeScript, the code is compiled in es3.
Therefore the compiler uses the following to run each promise:

```javascript
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
function empty() {
    return __awaiter(this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            return [2 /*return*/, true];
        });
    });
}
function loop() {
    return __awaiter(this, void 0, void 0, function () {
        var i;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    console.time('loop');
                    i = 0;
                    _a.label = 1;
                case 1:
                    if (!(i < 1000000)) return [3 /*break*/, 4];
                    return [4 /*yield*/, empty];
                case 2:
                    _a.sent();
                    _a.label = 3;
                case 3:
                    i++;
                    return [3 /*break*/, 1];
                case 4:
                    console.timeEnd('loop');
                    return [2 /*return*/];
            }
        });
    });
}
loop();
```

As you can imagine the code is significantly more expensive to run than the internal implementation of V8.
