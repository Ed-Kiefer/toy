#
# Toy - first attempt at .travis-ci.sh
#
OPAM_DEPENDS="ocamlfind ounit re"
case "$OCAML_VERSION,$OPAM_VERSION" in
4.03.0,1.2.2) ppa=avsm/ocaml43+opam12 ;;
*) echo Unknown $OCAML_VERSION,$OPAM_VERSION; exit 1;;
esac

echo "yes" | sudo add-apt-repository ppa:$ppa
sudo apt-get update -qq
sudo apt-get install -qq ocaml ocaml-native-compilers camlp4-extra opam
export OPAMYES=1
export MERLIN_TRAVIS=true
opam init
opam install ${OPAM_DEPENDS}
eval `opam config env`
make
make test

