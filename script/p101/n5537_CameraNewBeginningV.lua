-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 56.650333 , 88.424988 , 25.877769 , 9.500000 , [[Camera:ScriptSplineLookAtNpc(5537);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 57.650326 , 88.419228 , 25.877769 , 8.599997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 57.650326 , 88.419228 , 25.877769 , 9.400000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 57.650326 , 88.419228 , 25.877769 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
