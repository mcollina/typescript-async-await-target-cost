
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
