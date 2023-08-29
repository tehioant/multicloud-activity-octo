import {AxiosHeaders, AxiosInstance} from "axios";
import {useApi} from "@/api/api";


export async function PostTreat(
    email: string | undefined,
    text: string | undefined,
    treat: string | undefined,
        useAPi: () => AxiosInstance = useApi
): Promise<string> {
    const api = useAPi()
    const value = await api.post(
        `/api/alltribes`,
        {
            body: {
            'email': email,
            'treat': treat,
            'message': text
            }
        }
    )
    return value.data
}