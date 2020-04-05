mvn archetype:generate \
    -DarchetypeArtifactId=google-cloud-dataflow-java-archetypes-examples \
    -DarchetypeGroupId=com.google.cloud.dataflow \
    -DarchetypeVersion=1.9.0 \
    -DgroupId=com.example \
    -DartifactId=dataflow \
    -Dversion="0.1" \
    -DinteractiveMode=false \
    -Dpackage=com.example

export PROJECT_ID=my-test-project-270713
export BUCKET_NAME=lbarrera-1