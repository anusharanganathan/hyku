export DOMAIN=up2.digitalnest.co.uk

# Let's encrypt settings
# Enable or disable obtaining ssl certificates from let's encrypt.
#  Let's encrypt will need to be able to contact your domain
export USE_LETS_ENCRYPT=true
# Used to get ssl certificates for each tenant from let's encrypt
#   Separate each tenant with a space 
#   If no tenants, the certificate is obtained just for the domain
export TENANTS="repo1 repo2"
# The email address used to obtain the certificate. 
# You will receive emails from let's encrypt regarding the state of your certificates in this email id.
export EMAIL=test@digitalnest.co.uk
# This flag is used to obtain a test certificate rather than a real one from let's encrypt.
#   Set to false for production 
export USE_TEST_CERT=true
# Enable or disable shibboleth as an authentication mechanism

# Shibboleth settings
export USE_SHIBBOLETH=true
# The tenant that requires shibboleth authentication
export SHIBBOLETH_TENANT=repo1
