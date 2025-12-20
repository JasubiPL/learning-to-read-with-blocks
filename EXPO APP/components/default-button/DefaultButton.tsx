import { useRef } from "react";
import { Animated, Pressable, Text, View } from "react-native";
import { styles } from "./default-button-styles";

/**
 * Button Variants
 */
type Variant = "wood";

export const DefaultButton = ({ text, variant = "wood" }: { text: string, variant?: Variant }) => {
  const scaleAnim = useRef(new Animated.Value(1)).current;

  /**
   * Handle Press In Animation
   * @return void
   */
  const pressIn = () => {
    Animated.spring(scaleAnim, {
      toValue: 0.95,
      useNativeDriver: true,
    }).start();
  }

  /**
   * Handle Press Out Animation
   * @return void
   */
  const pressOut = () => {
    Animated.spring(scaleAnim, {
      toValue: 1,
      useNativeDriver: true,
    }).start();
  }

  return (
    <Animated.View style={{ transform: [{ scale: scaleAnim }] }} >
      <Pressable
        style={ styles[variant]}
        onPressIn={pressIn}
        onPressOut={pressOut}
        onPress={() => {
          console.log("Button Pressed");
        }}
      >
          <View style={styles[`${variant}BiselTop`]}></View>
          <View style={styles[`${variant}BiselLeft`]}></View>
          <View style={styles[`${variant}BiselRight`]}></View>
          <View style={styles[`${variant}BiselBottom`]}></View>
          <Text
            style={styles[`${variant}Text`]}
          >
            {text}
          </Text>
      </Pressable>
    </Animated.View>
  )
}