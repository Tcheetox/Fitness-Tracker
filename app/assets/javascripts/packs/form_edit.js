
window.onload = () => init()

const init = () => {
     // Adapt disabled input width
     document.querySelectorAll(".custom-input").forEach(i => {
        i.style.width = `${i.value.length}ch`
    })
    // Hook to modify disabled input fields
    document.querySelectorAll(".fa-user-edit").forEach(i => {
        i.addEventListener("click", () => {
            const forTarget = document.getElementById(i.getAttribute("for"))
            i.style.display = "none"
            forTarget.style.width = "auto"
            forTarget.removeAttribute("disabled")
            forTarget.focus()
        })
    })
}
