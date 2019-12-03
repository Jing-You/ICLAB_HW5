import numpy as np

def main():
    # load the feature maps
    unshuffle = np.load("feature_map/unshuffle.npy")
    conv1 = np.load("feature_map/conv1.npy")
    conv2 = np.load("feature_map/conv2.npy")
    conv3 = np.load("feature_map/conv3.npy")
    pool = np.load("feature_map/pool.npy")

    layer_sel = input("Enter the layer you want to show:\n 0 for unshuffle,\n 1 for conv1,\n 2 for conv2,\n 3 for conv3,\n 4 for pool: ")

    if(layer_sel == 0):
        channel_sel = input("Enter the channel you want to show (0 ~ 3): \n ")
        print(unshuffle[int(channel_sel)])
    elif(layer_sel == 1):
        channel_sel = input("Enter the channel you want to show (0 ~ 3): \n ")
        print(conv1[int(channel_sel)])
    elif(layer_sel == 2):
        channel_sel = input("Enter the channel you want to show (0 ~ 15): \n ")
        print(conv2[int(channel_sel)])
    elif(layer_sel == 3):
        channel_sel = input("Enter the channel you want to show (0 ~ 63): \n ")
        print(conv3[int(channel_sel)])
    elif(layer_sel == 4):
        channel_sel = input("Enter the channel you want to show (0 ~ 63): \n ")
        print(pool[int(channel_sel)])
    else:
        print("Please enter the number between 0 ~ 4")

if __name__ == '__main__':
    main()  