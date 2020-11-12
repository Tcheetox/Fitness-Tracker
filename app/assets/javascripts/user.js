
const adjustProfile = () => {
    $(document).ready(function() {
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
    })
}
