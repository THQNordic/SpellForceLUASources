-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 105.937637 , 538.078308 , 39.773148 , 14.900021 , [[Camera:ScriptSplineLookAtSpline();]] )
   Camera:MotionSpline_AddSplinePoint( 121.015701 , 531.909058 , 39.773148 , 7.399995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 136.583130 , 522.215698 , 38.773148 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 164.622772 , 502.450043 , 39.773148 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
