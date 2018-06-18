set -e

if [[ ( -f "RxSwift/Rx.xcodeproj/project.pbxproj" ) && (( -d "Carthage" ) || ( -d 'Pods' )) ]]; then
    pushd RxSwift
    git fetch origin --tags
    git reset 0.0.0 --hard
    popd
fi

if [[ ( ! -f "RxSwift/Rx.xcodeproj/project.pbxproj" ) && ( ! -d "Carthage" ) && ( ! -d 'Pods' ) ]]; then
    git submodule update --init --recursive --force
    pushd RxSwift
    git reset origin/master --hard
    popd
fi
