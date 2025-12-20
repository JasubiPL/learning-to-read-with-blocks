import { Dimensions, StyleSheet } from 'react-native';


const { width, height } = Dimensions.get('window');

export const styles = StyleSheet.create({
  container: {
    padding: 16,
    flex: 1,
    position: 'relative',
  },
  logo:{
    width: width - 32,
    resizeMode: 'contain',
    position: 'absolute',
    left: 16,
    top: height * 0.15,

  },
  startButton:{
    position: 'absolute',
    width: width - 64,
    bottom: 32,
    left: 32,
  }
});