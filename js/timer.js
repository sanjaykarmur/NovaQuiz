/* =========================================================
   NovaQuiz — timer.js
   A small reusable countdown timer.
   ========================================================= */

function createCountdownTimer({ totalSeconds, onTick, onExpire, warnAt = 60 }){
  let remaining = totalSeconds;
  let intervalId = null;

  function tick(){
    remaining--;
    onTick(remaining, remaining <= warnAt);
    if (remaining <= 0){
      stop();
      onExpire();
    }
  }

  function start(){
    onTick(remaining, remaining <= warnAt);
    intervalId = setInterval(tick, 1000);
  }
  function stop(){
    clearInterval(intervalId);
  }
  function elapsed(){
    return totalSeconds - remaining;
  }

  return { start, stop, elapsed, getRemaining: () => remaining };
}
