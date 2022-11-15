const status = document.querySelector(".status")

if (status === "pending") {
status.style.color = "orange"
} else if (status === "accepted") {
  status.style.color = "green"
} else {
  status.style.color = "red"
}
