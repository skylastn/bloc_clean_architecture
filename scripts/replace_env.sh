#!/bin/bash
envPath='env' # Path to the folder where all our .env files live
env=$1
# flagFile="./tmp/env_replaced_$env"

# # Check if the environment has already been replaced
# if [ -f "$flagFile" ]; then
#   echo "Environment '$env' already replaced. Skipping..."
#   exit 0
# fi

# Detect if the system is Windows or not
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
  COPY_CMD="copy"
else
  COPY_CMD="cp"
fi

# Validate if the environment input is provided
if [ -z "$1" ]; then
  echo "No environment supplied, allowed: [development, production]"
  exit 1
fi

# Set the input file based on the argument
case "$1" in
  "development") INPUT=".env.development"
  ;;
  "production") INPUT=".env.production"
  ;;
  *)
    echo "Missing arguments [development|production]"
    exit 1
  ;;
esac

# Execute the appropriate copy command based on the OS
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
  powershell.exe -Command "Copy-Item -Path '$INPUT' -Destination '.env' -Force"
else
  $COPY_CMD "$INPUT" ".env"
fi

echo "Copied '$INPUT' to '.env'"

# Create the flag file to indicate that the environment has been replaced
# touch "$flagFile"

# Optional Dart build commands
# dart run build_runner clean
# dart run build_runner build --delete-conflicting-outputs
