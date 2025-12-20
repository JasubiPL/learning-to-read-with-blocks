import { colors } from "@/constants/colors";
import { StyleSheet } from "react-native";

export const styles = StyleSheet.create({
  wood: {
    width: '100%',
    padding: 16,
    backgroundColor: colors.primary,
    borderBlockColor: colors.secondary,
    borderWidth: 3,
  },
  woodText:{
    fontSize: 24,
    color: colors.secondary,
    textAlign: 'center',
    fontFamily: 'PressStart2P_400Regular',
  },
  woodBiselTop: {
    position: 'absolute',
    top: 0,
    left: 0,
    right: 0,
    height: 4,
    backgroundColor: colors.woodBiselTopAndLeft,
  },
  woodBiselLeft: {
    position: 'absolute',
    top: 0,
    left: 0,
    bottom: 0,
    width: 4,
    backgroundColor: colors.woodBiselTopAndLeft,
  },
  woodBiselRight: {
    position: 'absolute',
    top: 0,
    right: 0,
    bottom: 0,
    width: 4,
    backgroundColor: colors.woodBiselBottomAndRight,
  },
  woodBiselBottom: {
    position: 'absolute',
    left: 0,
    right: 0,
    bottom: 0,
    height: 4,
    backgroundColor: colors.woodBiselBottomAndRight,
  },
});