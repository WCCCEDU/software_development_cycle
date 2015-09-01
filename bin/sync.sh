SOURCE_BRANCH=`git rev-parse --abbrev-ref HEAD`

syncBranch(){
  echo "Syncing to remote $1"
  DEST_BRANCH = $1
  DEST_REMOTE = $2
  git checkout $DEST_BRANCH

  # Make sure we actually made it to the destination branch
  if [ `git rev-parse --abbrev-ref HEAD` != $DEST_BRANCH ]; then
    echo "!!!! Something went wrong check the errors above and try again !!!!"
    exit 0
  fi

  git push $DEST_REMOTE $DEST_BRANCH --force
}

syncBranch master wcccedu
syncBranch gh-pages wcccedu

git checkout $SOURCE_BRANCH
