require "roda"
require "webauthn"

class App < Roda
	WebAuthn.configure do |config|
		# This value needs to match `window.location.origin` evaluated by
		# the User Agent during registration and authentication ceremonies.
		config.origin = "localhost"
				# Relying Party name for display purposes
		config.rp_name = "Example Inc."
				# Optionally configure a client timeout hint, in milliseconds.
		# This hint specifies how long the browser should wait for any
		# interaction with the user.
		# This hint may be overridden by the browser.
		# https://www.w3.org/TR/webauthn/#dom-publickeycredentialcreationoptions-timeout
		# config.credential_options_timeout = 120_000
				# You can optionally specify a different Relying Party ID
		# (https://www.w3.org/TR/webauthn/#relying-party-identifier)
		# if it differs from the default one.
		#
		# In this case the default would be "auth.example.com", but you can set it to
		# the suffix "example.com"
		#
		# config.rp_id = "example.com"
				# Configure preferred binary-to-text encoding scheme. This should match the encoding scheme
		# used in your client-side (user agent) code before sending the credential to the server.
		# Supported values: `:base64url` (default), `:base64` or `false` to disable all encoding.
		#
		# config.encoding = :base64url
				# Possible values: "ES256", "ES384", "ES512", "PS256", "PS384", "PS512", "RS256", "RS384", "RS512", "RS1"
		# Default: ["ES256", "PS256", "RS256"]
		#
		# config.algorithms << "ES384"
	end
		route do |r|
		r.get "registration" do
			response['Content-Type'] = 'application/json'
			# Generate and store the WebAuthn User ID the first time the user registers a credential
			name = r.params["user"]
			webauthn_id = WebAuthn.generate_user_id

			options = WebAuthn::Credential.options_for_create(
				user: { id: webauthn_id, name: name }
			)

			# Store the newly generated challenge somewhere so you can have it
			# for the verification phase.
			"#{options.as_json.to_json}"

			# Send `options` back to the browser, so that they can be used
			# to call `navigator.credentials.create({ "publicKey": options })`
			#
			# You can call `options.as_json` to get a ruby hash with a JSON representation if needed.

			# If inside a Rails controller, `render json: options` will just work.
			# I.e. it will encode and convert the options to JSON automatically.

			# For your frontend code, you might find @github/webauthn-json npm package useful.
			# Especially for handling the necessary decoding of the options, and sending the
			# `PublicKeyCredential` object back to the server.
		end

	end
end
run App.freeze.app