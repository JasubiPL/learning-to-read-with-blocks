import { useRouter } from "expo-router";
import { Image, useWindowDimensions, View } from "react-native";

import { useEffect } from "react";
import { styles } from "./styles";

export default function SplashScreen(){
  const router = useRouter();
  const { width } = useWindowDimensions();

  useEffect(() => {
    const timeout = setTimeout(() => {
      router.replace('/home');
    }, 2000);

    return () => clearTimeout(timeout);
  
  }, []);

  return (
    <View style={styles.container}>
      <Image
        source={require("../assets/images/pineyrosoft-logo.png")} 
        style={{
          width: width * 0.8,
        }} 
        resizeMode="contain"
      />
    </View>
  )
}
