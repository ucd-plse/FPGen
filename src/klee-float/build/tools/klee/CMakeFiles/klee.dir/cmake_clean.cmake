FILE(REMOVE_RECURSE
  "CMakeFiles/klee.dir/main.cpp.o"
  "../../bin/klee.pdb"
  "../../bin/klee"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang CXX)
  INCLUDE(CMakeFiles/klee.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
