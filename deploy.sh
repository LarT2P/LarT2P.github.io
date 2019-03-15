if [ "$1" = "-i" ]
then
    git clone https://github.com/LarT2P/wiki ./wiki
    cd wiki/
    exit 0
elif [ "$1" = "" ]
then
    echo deploy [Option]
    echo "       -i 初始化"
    echo "       message  提交到github并发布，提交信息为mesage"
    echo '*.pyc\noutput/' > .gitignore
    exit 0
else
    simiki g
    echo "生成文件"

    cd docs
    echo "进入docs"

    rm -rf ./*
    echo "删除docs下原有文件"

    cp -r ../output/* ./
    echo "拷贝output文件到docs"

    echo "提交文件"
    cd ..
    git add .
    git commit -m "$1"
    git pull origin master
    git push origin master
fi
