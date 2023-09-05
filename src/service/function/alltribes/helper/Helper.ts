import { Context, Form, HttpRequest, Logger } from "@azure/functions";

export const buildContext = (): Context => ({
    bindingData: undefined,
    bindingDefinitions: [],
    bindings: {},
    executionContext: undefined,
    invocationId: "",
    log: createLogger(),
    traceContext: undefined,
    done: () => {},
});

export const buildHttpRequest = (): HttpRequest => ({
    headers: undefined,
    method: undefined,
    params: undefined,
    parseFormBody(): Form { return undefined; },
    query: {},
    get: undefined,
    url: "",
    user: undefined,
});

const createLogger = (): Logger => {
    const logger = () => {};
    logger.error = () => {};
    logger.info = () => {};
    logger.verbose = () => {};
    logger.warn = () => {};
    return logger;
};

export interface AuthenticationModel {
    keyFile?: string;
    keyFilename?: string;
    autoRetry?: boolean;
    projectId?: string;
    apiEndpoint?: string;
    maxRetries?: number;
    client_id?: string;
    client_secret?: string;
    scope?: string[];
    email?: string;
}