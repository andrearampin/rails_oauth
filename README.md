# OAuth client
This OAuth2 client was developed with the only purpose of showcasing an OAuth2 connection with a custom provider ([Doorkeeper](https://github.com/doorkeeper-gem/doorkeeper)). However, this simple Ruby on Rails (5.x) application can be used with any other OAuth2 provider.

## Setup

Clone this repository and install any missing gem

```
$ git clone git@github.com:andrearampin/rails_oauth.git
$ cd rails_oauth
$ bundle install
```

Once obtained new credentials from the OAuth provider, open and update `app/config/application.rb`.

```
    ...
    # Example: bdfe2ffad2c6e5f5e19637ee8ceb46bf1c913e2
    config.client_id = '<client_id>'

    # Example: bdfe2ffad2c6e5f5e19637ee8ceb46bf1c913e2
    config.client_secret = '<client_secret>'

    # Example: http://lvh.me:3001/oauth/callback
    config.redirect_uri = '<redirect_uri>'

    # Example: http://oauth.provider.com.au (OAuth provider)
    config.site = '<site>'
    ...
```

## Run

Run the server
```
$ rails s -p 3000
```

and open `http://localhost:3000/`. Click on `Link Airtax` to get a new authentication token for your application so to be able to interact with the (OAuth2 pretected) endpoints.

## Additional documentation
- [Ruby on Rails](http://rubyonrails.org/)
- [OAuth2 specs](https://oauth.net/2/)
- [OAuth2 gem](https://github.com/oauth-xx/oauth2)
