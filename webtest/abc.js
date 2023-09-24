//https://stackoverflow.com/a/2117523
function uuidv4() {
  return ([1e7] + -1e3 + -4e3 + -8e3 + -1e11).replace(/[018]/g, c =>
    (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
  );
}

function getCredentials(challengeServer) {

  const publicKeyCredentialCreationOptions = {
    // to z serwera
    challenge: Uint8Array.from(
      challengeServer, c => c.charCodeAt(0)),
    rp: {
      name: "Duo Security",
      id: "localhost",
    },
    user: {
      id: Uint8Array.from(
        uuidv4(), c => c.charCodeAt(0)),
      name: "lee@webauthn.guide",
      displayName: "Lee",
    },
    pubKeyCredParams: [{ alg: -7, type: "public-key" }],
  };

  sendCredentials(publicKeyCredentialCreationOptions)
}

async function sendCredentials(publicKeyCredentialCreationOptions) {
  const credential = await navigator.credentials.create({
    publicKey: publicKeyCredentialCreationOptions
  });

  // credential.then(send(credential))
  var encoded = CBOR.encode(credential);
  var decoded = CBOR.decode(encoded);

  console.log(decoded)
  console.log(credential)
}

fetch('http://localhost:3000/')
  .then(response => response.text())
  .then(data => randomStringFromServer = data)
  .then((challengeServer) => {
    this.getCredentials(challengeServer);
  });

function send(credential) {
  var oReq = new XMLHttpRequest();
  oReq.open("POST", 'http://localhost:3000/register', true);
  // oReq.onload = function (oEvent) {
  //   // Uploaded.
  // };
  oReq.send(credential);
}