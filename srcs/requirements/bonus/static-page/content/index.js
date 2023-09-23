const isValidEmailAddress = (addr) => {
        const regEx = /^\w+@\w+\.\w+$/g;
        const result = regEx.exec(addr);
        if (!result)
                return false;
        return true;
};

const validate = (addr) => {
        const h1 = document.getElementById("h1");
        let result = "Not valid";
        if (isValidEmailAddress(addr))
                result = "Valid";
        h1.innerHTML = result;
}

console.log("Email validator, HELLO WORLD!!");

const text = document.getElementById("text");
const button = document.getElementById("button");

button.addEventListener("click", () => {
        const value = text.value;
        if (!value) {
                console.error("No value!");
        } else {
                console.log("Validating...");
                validate(value);
        }
});
