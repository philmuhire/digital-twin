from mangum import Mangum
from server import app

# Create the Lambda handler
# It's setup to be the actual function that will be called by AWS Lambda
handler = Mangum(app)