from keras.models import load_model
from keras import backend as K
import tensorflow as tf
from keras.utils.vis_utils import plot_model

K.set_learning_phase(0)
model = load_model("models/single_save_for_hololens.hdf5")

tfgraph = K.get_session().graph

graph_def = tfgraph.as_graph_def()

print(model.outputs)

tf.train.write_graph(graph_def, '.', 'single_save_for_hololens.pb', as_text = True)
saver = tf.train.Saver()
saver.save(K.get_session(), './single_save_for_hololens.ckpt')