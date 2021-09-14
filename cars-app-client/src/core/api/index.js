import axios from 'axios';

const api = axios.create({
    baseURL: '/api/v1',
    timeout: 10000,
});


export const getCars = async () => {
    try {
        const { data } = await api.get('/cars');
        return data;
    } catch (error) {
        console.error(error);
    }
}
export const getCarById = async (id) => {
    try {
        const { data } = await api.get(`/cars/${id}`);
        return data;
    } catch (error) {
        console.error(error);
    }
}

export const getDrivers = async () => {
    try {
        const { data } = await api.get('/drivers');
        return data;
    } catch (error) {
        console.error(error);
    }
}

export const getDriverById = async (id) => {
    try {
        const { data } = await api.get(`/drivers/${id}`);
        return data;
    } catch (error) {
        console.error(error);
    }
}
export const createCar = async (payload) => {
    try {
        const { data } = await api.post('/cars', payload);
        return data;
    } catch (error) {
        console.error(error);
    }
}

export const createDriver = async (payload) => {
    try {
        const { data } = await api.post('/drivers', payload);
        return data;
    } catch (error) {
        console.error(error);
    }
}

export const attachDriversAndCars = async (payload) => {
    try {
        const { data } = await api.post('/driver_cars', payload)
    } catch (error) {
        console.error(error)
    }
}