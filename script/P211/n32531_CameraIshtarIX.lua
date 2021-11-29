-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 371.867828 , 255.891922 , 25.792349 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9811);]] )
   Camera:MotionSpline_AddSplinePoint( 371.068726 , 254.959991 , 25.792349 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9811);]] )
   Camera:MotionSpline_AddSplinePoint( 370.765442 , 254.606293 , 25.792349 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9811);]] )
   Camera:MotionSpline_AddSplinePoint( 369.845032 , 253.532898 , 25.792349 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9811);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
