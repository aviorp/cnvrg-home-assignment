export const TYPES = { driver: "Driver", car: "Car" };


export const toBase64 = file => new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => resolve(reader.result);
    reader.onerror = error => reject(error);
});


export const awnOptions = {
    position: "bottom-left",
}


export const normalizer = (node) => {
    return {
        id: node.id,
        label: node.name,
    }
};