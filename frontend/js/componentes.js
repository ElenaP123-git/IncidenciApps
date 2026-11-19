// IncidenciApp - comportamiento mínimo de los componentes

// Mostrar / ocultar contraseña
// y cada vez que se pulsa se enseña uno y se esconde el otro.
document.querySelectorAll("[data-toggle-password]").forEach((boton) => {
  boton.addEventListener("click", () => {
    const entrada = document.getElementById(boton.dataset.togglePassword);
    const visible = entrada.type === "text";
    entrada.type = visible ? "password" : "text";
    boton.setAttribute("aria-label", visible ? "Mostrar contraseña" : "Ocultar contraseña");
    boton.querySelectorAll("svg").forEach((dibujo) => { dibujo.toggleAttribute("hidden"); });
  });
});

// Validación de ejemplo: marca el campo con .campo--error y muestra su mensaje
function marcarError(campo, hayError) {
  campo.classList.toggle("campo--error", hayError);
  const entrada = campo.querySelector(".campo__entrada");
  entrada.setAttribute("aria-invalid", hayError ? "true" : "false");
}

document.querySelectorAll("form[data-validar]").forEach((form) => {
  form.setAttribute("novalidate", "");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    form.querySelectorAll(".campo").forEach((campo) => {
      const entrada = campo.querySelector(".campo__entrada");
      if (!entrada || !entrada.required) return;
      const valor = entrada.value.trim();
      let malo = valor === "";
      if (!malo && entrada.type === "email") malo = !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(valor);
      if (!malo && entrada.type === "password") malo = valor.length < 8;
      marcarError(campo, malo);
    });
  });
  form.addEventListener("input", (e) => {
    const campo = e.target.closest(".campo");
    if (campo && campo.classList.contains("campo--error")) marcarError(campo, false);
  });
});
