import { AzureFunction, Context, HttpRequest } from "@azure/functions";
const { Storage } = require('@google-cloud/storage');

const httpTrigger: AzureFunction = async function (context: Context, req: HttpRequest): Promise<void> {
    context.log('HTTP trigger function processed a request. for ' + JSON.stringify(req));
    console.log('HTTP trigger function processed a request. for ' + JSON.stringify(req));

    context.res = {
        // status: 200, /* Defaults to 200 */
        body: req.body
    };

    // Creates a client
    const storage = new Storage();

    const [acls] = await storage.bucket('alltribes-bucket').acl.get();

    acls.forEach(acl => {
        console.log(`${acl.role}: ${acl.entity}`);
    });


    const bucket = storage.bucket('alltribes-bucket');

//-
// Upload a file from a local path.
//-
    bucket.upload('/Users/a.tehio-pesselet/Documents/Octo/contribution/multicloud-activity-octo/src/service/function/alltribes/google/Sigle_OCTO_marine.png', function(err, file, apiResponse) {
        // Your bucket now contains:
        // - "image.png" (with the contents of `/local/path/image.png')

        // `file` is an instance of a File object that refers to your new file.
        console.log(apiResponse)
    });

};

export default httpTrigger;