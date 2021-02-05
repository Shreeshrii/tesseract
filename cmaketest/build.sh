### from root

git clone git@github.com:DanBloomberg/leptonica.git
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -S leptonica -B leptonica-build
cmake --build leptonica-build
cmake --install leptonica-build --prefix leptonica-install

git clone git@github.com:tesseract-ocr/tesseract.git
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -S tesseract -B tesseract-build
cmake --build tesseract-build
cmake --install tesseract-build --prefix tesseract-install

cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$(readlink -f tesseract-install) -DLeptonica_DIR=$(readlink -f leptonica-install/lib/cmake) -S cmaketest -B test-build
cmake --build test-build
cmake --install test-build --prefix test-install