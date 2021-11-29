-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 215.598068 , 141.522675 , 23.168530 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(141.835,137.271,28.450);]] )
   Camera:MotionSpline_AddSplinePoint( 196.534088 , 143.022766 , 26.123539 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 177.425400 , 141.837173 , 27.883541 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 164.341949 , 139.956329 , 27.094252 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 8.000000 )
   Camera:MotionSpline_SetCorrection( 0.000000 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
