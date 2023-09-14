import axios, {AxiosInstance} from 'axios'

let api: AxiosInstance

function createApi() {
    api = axios.create({
        baseURL: "https://7boquyqllnn5hgvnvtxs247bcu0yrrxc.lambda-url.eu-west-3.on.aws/"
    })
    // We set an interceptor for each request to
    // include Bearer token to the request if user is logged in
    api.interceptors.request.use((config) => {
        return config
    })

    return api
}

function getAuthorizationToken() {

    let octoSessionObjects = Object.values(sessionStorage)
        .map(o => JSON.parse(o))
        .filter(o => o.environment.includes("octo"));
    return octoSessionObjects.length ?
        octoSessionObjects.find(o => o.credentialType == 'IdToken').secret :
        null;
}

export const useApi = () => {
    if (!api) {
        createApi()
    }
    return api
}
