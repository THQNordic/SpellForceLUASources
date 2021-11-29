-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 651.021240 , 241.934158 , 12.622918 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(689.100,240.550,15.450);]] )
   Camera:MotionSpline_AddSplinePoint( 668.211609 , 241.253738 , 12.652912 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(689.100,240.550,15.450);]] )
   Camera:MotionSpline_AddSplinePoint( 680.889587 , 240.751923 , 15.652919 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(689.100,240.550,15.450);]] )
   Camera:MotionSpline_AddSplinePoint( 687.901062 , 240.474380 , 15.652919 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(689.100,240.550,15.450);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
