# env.sh - Shared paths for the pwm8_spi / SCL C1D flow Source it: . flow/env.sh
export PROJ="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"                  # Project root (no spaces in the path)
export SCL="$HOME/scl"                                                             # PDK install root
export PDK_ROOT="$SCL/my_dtech/Open_Source_SCL_1.2micron_PDK_digital/open_source_scl_c1d/open_pdks"  # PDK root
export C1D="$PDK_ROOT/sclc1d/digital_c1d"                                          # Std-cell views (lib, lef, gds, verilog)
export KTECH="$PDK_ROOT/sclc1d/libs.tech/klayout/tech"                             # KLayout DRC / LVS decks
export PADF="$SCL/PadFrame_C1D"                                                    # Pad frame kit
export C1D_V="$C1D/verilog/c1d.v"                                                  # Cell Verilog models
export OL_IMAGE="ghcr.io/the-openroad-project/openlane:ff5509f65b17bfa4068d5336495ab1718987ff69-amd64"  # OpenLane 1.0.2 image
export PROJ_NS="$PROJ"                                                            # Space-free project path used for container paths
