import { PressStart2P_400Regular } from '@expo-google-fonts/press-start-2p';
import { useFonts } from 'expo-font';
import { Stack } from 'expo-router';
import { SafeAreaProvider } from 'react-native-safe-area-context';

export default function Layout() {

  /**
   * Load Fonts for the App
   */
  const [fontsLoaded] = useFonts({
    PressStart2P_400Regular,
  });
  if (!fontsLoaded) {
    return null;
  }
  
  return (
    <SafeAreaProvider style={{ flex: 1, paddingTop: 32 }}>
      <Stack
        screenOptions={{
          headerShown: false,
        }}
      />
    </SafeAreaProvider>
  )
}
