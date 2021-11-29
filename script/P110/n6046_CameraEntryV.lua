-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 78.262260 , 505.517731 , 43.081554 , 9.900002 , [[Camera:ScriptSplineLookAtPosition(83.408,513.534,40.870);]] )
   Camera:MotionSpline_AddSplinePoint( 74.768311 , 501.062500 , 44.091553 , 6.299996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 59.675278 , 488.859894 , 45.151703 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 52.084496 , 473.069061 , 46.121647 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
