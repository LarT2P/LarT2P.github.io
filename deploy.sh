if [ "$1" = "-i" ]
then
    mkdir output
    cd output
    git clone -b gh-pages git@github.com:Lart2P/wiki.git ./
    cd ..
    exit 0
elif [ "$1" = "" ]
then
    echo deploy [Option]
    echo "       -i 初始化"
    echo "       message  提交到github并发布，提交信息为mesage"
    echo -e '*.pyc\noutput' > .gitignore
    exit 0
else
    simiki g
    cp -r output/ docs/
    git add .
    git commit -m "$1"
    git pull origin master
    git push origin master
fi
