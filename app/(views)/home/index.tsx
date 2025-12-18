import { Image, ImageBackground, View } from "react-native";

import { DefaultButton } from "@/components/default-button/DefaultButton";
import { styles } from "./home-styles";

export default function Home() {
  return (
    <ImageBackground
      source={require('../../../assets/images/background-home.png')}
      style={{ flex: 1 }}
      resizeMode="cover"
    >
      <View style={styles.container}>
        <Image
          style={styles.logo}
          source={require('../../../assets/images/game-logo.png')}
        />
        <View style={styles.startButton}>
          <DefaultButton
          text="Jugar" 
          variant="wood" 
          />
        </View>
      </View>
    </ImageBackground>
  );
}