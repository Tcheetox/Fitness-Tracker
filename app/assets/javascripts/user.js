$(document).on('turbolinks:load', function() {
    // Add hook to modify disabled input fields
    document.querySelectorAll(".fa-user-edit").forEach(i => {
        i.addEventListener("click", () => {
            const forTarget = document.getElementById(i.getAttribute("data-for"))
            i.style.display = "none"
            forTarget.style.width = "auto"
            forTarget.removeAttribute("disabled")
            forTarget.focus()
        })
    })
})
