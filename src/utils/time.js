const date = new Date()
const hour = date.getHours()

export function setTime() {
  if (hour >= 0 && hour <= 6) {
    return '凌晨了，早点休息吧~'
  } else if (hour >= 7 && hour <= 12) {
    return '早上好，今天也是新的一天~'
  } else if (hour >= 13 && hour <= 15) {
    return '中午好，注意合理休息~'
  } else if (hour >= 16 && hour <= 18) {
    return '下午好~'
  } else {
    return '晚上好~'
  }
}
