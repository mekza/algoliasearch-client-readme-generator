#! /bin/sh

echo "Generate README.mds"

./doc-generator.rb config.json
if [ "$?" != "0" ] ; then
  echo "Generation failed: stop"
  exit 1
fi

for dir in ../algoliasearch-client-*; do
  echo "$dir/README.md"
  cd $dir
  git diff README.md
  git commit README.md
  git pull -r
  if [ "$?" != "0" ] ; then
    echo "Pull refused stop"
    exit 1
  fi
  git push
  if [ "$?" != "0" ] ; then
    echo "Push refused stop"
    exit 1
  fi
done

echo "README.mds commited !"
