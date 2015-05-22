package com.wky.ann;

import java.io.File;
import org.joone.engine.Monitor;
import org.joone.engine.NeuralNetListener;
import org.joone.helpers.factory.JooneTools;
import org.joone.io.FileInputSynapse;
import org.joone.net.NeuralNet;
import org.joone.net.NeuralNetAttributes;
import org.joone.util.NormalizerPlugIn;

public class Artificial_Neural_Networks implements NeuralNetListener {
    
    private static final String fileName = "src/com/wky/ann/zonghe.txt";
    private static final int trainingRows = 30;
    
    private double[][] inputTrain;
    private double[][] desiredTrain;
    private double[][] inputTest;
    private double[][] desiredTest;
    
    /**
     * Creates a new instance of Validation_using_stream 
     */
    public Artificial_Neural_Networks() {
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
    	Artificial_Neural_Networks me = new Artificial_Neural_Networks();
        me.go();
    }
    
    public void go() {
        // Prepare the training and testing data set
        FileInputSynapse fileIn = new FileInputSynapse();
        fileIn.setInputFile(new File(fileName));
        fileIn.setAdvancedColumnSelector("1-10");
        /** 取消归一化
        // Input data normalized between -1 and 1
        NormalizerPlugIn normIn = new NormalizerPlugIn();
        normIn.setAdvancedSerieSelector("1-7");
        normIn.setMin(-1);
        normIn.setMax(1);
        fileIn.addPlugIn(normIn);
        // Target data normalized between 0 and 1
        NormalizerPlugIn normOut = new NormalizerPlugIn();
        normOut.setAdvancedSerieSelector("8-10");
        fileIn.addPlugIn(normOut);
        */
        // Extract the training data
        inputTrain = JooneTools.getDataFromStream(fileIn, 1, trainingRows, 1, 7);
        desiredTrain = JooneTools.getDataFromStream(fileIn, 1, trainingRows, 8, 10);
        
        // Extract the test data
        inputTest = JooneTools.getDataFromStream(fileIn, trainingRows+1, 38, 1, 7);
        desiredTest = JooneTools.getDataFromStream(fileIn, trainingRows+1, 38, 8, 10);
        
        int[] nodes = { 7, 1, 3 };
        NeuralNet nnet = JooneTools.create_standard(nodes, JooneTools.LOGISTIC);
        // Set optimal values for learning rate and momentum
        nnet.getMonitor().setLearningRate(0.1);
        nnet.getMonitor().setMomentum(0.5);
//        nnet.getMonitor().setSingleThreadMode(false);
        // Trains the network
        JooneTools.train(nnet, inputTrain, desiredTrain, 
                5000,   // Max # of epochs 
                0.010,  // Stop RMSE
                100,    // Epochs between output reports
                this,   // The listener
                false); // Runs in synch mode
        
        // Gets and prints the final values
        NeuralNetAttributes attrib = nnet.getDescriptor();
        System.out.println("Last training rmse="+attrib.getTrainingError()+
                " at epoch "+attrib.getLastEpoch());
        
        double[][] out = JooneTools.compare(nnet, inputTest, desiredTest);
        System.out.println("Comparion of the last "+out.length+" rows:");
        int cols = out[0].length/2;
        for (int i=0; i < out.length; ++i) {
            System.out.print("\nOutput: ");
            for (int x=0; x < cols; ++x) {
                System.out.print(out[i][x]+" ");
            }
            System.out.print("\tTarget: ");
            for (int x=cols; x < cols*2; ++x) {
                System.out.print(out[i][x]+" ");
            }
        }
    }

    public void cicleTerminated(org.joone.engine.NeuralNetEvent e) {
        // Gets the current values
        Monitor mon = (Monitor)e.getSource();
        int epoch = mon.getTotCicles() - mon.getCurrentCicle() + 1;
        double trainErr = mon.getGlobalError();
        
        // Test a clone of the network
        NeuralNet n = e.getNeuralNet().cloneNet();
        double testErr = JooneTools.test(n, inputTest, desiredTest);
        System.out.println("Epoch "+epoch+":\n\tTraining error="+trainErr+"\n\tValidation error="+testErr);
    }

    public void errorChanged(org.joone.engine.NeuralNetEvent e) {
    }

    public void netStarted(org.joone.engine.NeuralNetEvent e) {
        System.out.println("Training...");
    }

    public void netStopped(org.joone.engine.NeuralNetEvent e) {
        System.out.println("Training stopped.");
    }

    public void netStoppedError(org.joone.engine.NeuralNetEvent e, String error) {
        System.out.println("Training stopped with error "+error);
    }
    
}