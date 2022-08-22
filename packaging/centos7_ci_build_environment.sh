echo "environment variables "
source scl_source enable devtoolset-11 || echo "devtoolset11"
echo "devtoolset-11 active"

if [ -d "../build_scripts" ]; then echo "please exec from repository root (one folder up)"; exit 1; fi


if [ -z $EDA_SRC ]; then 
    export EDA_SRC=$(pwd)/src
fi
echo "EDA_SRC $EDA_SRC"

if [ -z $ACT_HOME ]; then 
    export ACT_HOME=/opt/act
  export PATH=${ACT_HOME}/bin:${PATH}
fi
echo "ACT_HOME $ACT_HOME"

echo "loaded"
